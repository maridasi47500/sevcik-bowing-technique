from flask import Flask, render_template, request, redirect, url_for
import subprocess
from dbscores import init_db, get_all_scores, get_score_by_id, save_score
from flask import send_file
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
            "semitones": row[3],
            "mesures": row[4],
            "mesurestext": row[5],
            "times": row[6],
            "musictext": row[7],
            "nbnotes": row[8]

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
            message = f"Séance '{scores[theme]['nom']}' lancée avec succès !"
        else:
            message = "Thème invalide."

        return render_template('index.html', namescore=scores[theme]['theme'], scores=scores, menu=scores, message=message)
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

    file_pointer = open("./scores/"+request.form["theme"]+"_1.ly")
    contents = file_pointer.read()
    file_pointer = open("./scores/currentscore.html", "w")
    file_pointer.write("<h1>"+request.form["theme"]+" score</h1>"+"<lilypond staffsize=34>"+contents+"</lilypond>")
    file_pointer.close()
    subprocess.run(["lilypond-book", "scores/currentscore.html", "-f", "html", "--output", "scores/current"+request.form["theme"]]) 
    file_pointer = open("./scoreexample.ly")
    contents = file_pointer.read()
    contents=contents.replace("TIMESCOREHERE", request.form["times"]).replace("CONTENTSCOREHERE", request.form["musictext"])
    file_pointer = open("./scores/"+request.form["theme"]+"_2.ly", "w")
    file_pointer.write(contents)
    file_pointer.close()
    subprocess.run(["sh", "./texterythme.sh", request.form["theme"], request.form["semitones"], request.form["mesures"], request.form["mesurestext"]]) 
    file_pointer = open("./c.ki")
    contents = file_pointer.read()
    file_pointer = open("./scores/newscore.html", "w")
    file_pointer.write("<h1>"+request.form["nom"]+"</h1>"+"<lilypond staffsize=34>"+contents+"</lilypond>")
    file_pointer.close()
    subprocess.run(["lilypond-book", "scores/newscore.html", "-f", "html", "--output", "scores/mynewscore"+request.form["theme"]]) 
    save_score(
        request.form["theme"],
        request.form["nom"],
        int(request.form["semitones"]),
        int(request.form["mesures"]),
        int(request.form["mesurestext"]),
        request.form["times"],
        int(request.form["nbnotes"]),
        request.form["musictext"],
        score_id=score_id
    )

    return redirect(url_for("index"))



if __name__ == "__main__":
    app.run(host='0.0.0.0', port=4000, debug=True)

