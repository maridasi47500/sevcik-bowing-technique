from flask import Flask, render_template, request, redirect, url_for
from dbscores import init_db, get_all_scores, get_score_by_id, save_score
from flask import send_file
import json
import json
from dbscores import create_effet, create_type_effet  # assure-toi que ces fonctions existent
from dbscores import get_effet_by_id, get_etapes_effet
import asyncio
from dbscores import get_all_effets
import asyncio
import websockets
import threading




def nettoyer_json_embedded(data, max_depth=5):
    """essaie de décoder un json encodé plusieurs fois."""
    for _ in range(max_depth):
        if isinstance(data, list):
            return data
        try:
            data = json.loads(data)
        except (json.JSONDecodeError, TypeError):
            break
    return data if isinstance(data, list) else []






app = Flask(__name__)

init_db()

def charger_scores_depuis_db():
    rows = get_all_scores()
    scores = {}
    for row in rows:
        theme = row[1]
        scores[theme] = {
            "id": row[0],
            "theme": row[1],
            "nom": row[2],
            "musique": row[3],
            "lumiere": row[4],
            "directions": nettoyer_json_embedded(row[5]),
            "motivations": nettoyer_json_embedded(row[6]),
            "nombre_max_tours": row[7],
            "duree_phase": row[8],
            "pas_tours": row[9],
            "repetitions": row[10],
            "nbmintours": row[11]
        }
    return scores

menu_scores = charger_scores_depuis_db()



@app.route('/', methods=['GET', 'POST'])
def index():
    scores = charger_scores_depuis_db()
    if request.method == 'POST':
        randomlist = request.form.get('randomlist')
        theme = request.form.get('theme')
        if theme in scores:
            generer_score_yaml(theme, randomlist=randomlist)
            message = f"Séance '{scores[theme]['nom']}' lancée avec succès !"
        else:
            message = "Thème invalide."

        return render_template('index.html', scores=scores, menu=scores, message=message)
    return render_template('index.html', scores=scores, menu=scores)





@app.route("/edit/<int:score_id>")
def edit(score_id):
    score = get_score_by_id(score_id)
    return render_template("form.html", score=score)

@app.route("/new")
def new():
    return render_template("form.html", score=None)

@app.route("/save", methods=["POST"])
def save():
    score_id = request.form.get("id")
    save_score(
        request.form["theme"],
        request.form["nom"],
        int(request.form["semitones"]),
        int(request.form["mesures"]),
        int(request.form["mesurestext"]),
        int(request.form["times"]),
        int(request.form["nbnotes"]),
        request.form["musictext"],
        score_id=score_id
    )

    return redirect(url_for("index"))



if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)

