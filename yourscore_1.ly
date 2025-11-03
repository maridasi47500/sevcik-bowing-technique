
%% Fichier LilyPond généré par Denemo version 2.5.0

%%http://www.gnu.org/software/denemo/

\version "2.22"

CompactChordSymbols = {}
#(define DenemoTransposeStep 0)
#(define DenemoTransposeAccidental 0)
DenemoGlobalTranspose = \void {}
titledPiece = {}
AutoBarline = {}
AutoEndMovementBarline = \bar "|."

% The music follows

MvmntIVoiceI = {
  c''8 d'' c'' b' c'' b' c'' a' g' a' g' fis' g' fis' g' e' f' g' f' d' e' f' e' c' d' g' fis' g' fis' g' a' b' c'' d'' c'' b' c'' b' c'' a' g' a' g' fis' g' fis' g' e' d' g' fis' g' d' fis' e' fis' g' b' d'' c'' b' a' g' f' e' fis' gis' e' fis' gis' a' fis' gis' e'' d'' c'' b' a' gis' e' a' b' c'' a' b' c'' d'' b' c'' a'' g'' f'' e'' d'' c'' a' d' e' fis' d' e' fis' g' e' fis' d'' c'' b' a' g' fis' d' g a b g a b c' a b g' fis' e' d' c' b g g' fis' e' dis' e' fis' g' b' c'' b' a' gis' a' b' c'' e'' d'' e'' d'' b' d'' c'' b' a' g' a' g' fis' g' gis' a' b' c'' d'' c'' b' c'' b' c'' a' g' a' g' fis' g' fis' g' e' f' g' f' d' e' f' e' c' d' g' fis' g' fis' g' a' b' c'' d'' c'' b' c'' b' c'' a' g' a' g' fis' g' fis' g' e' d' e' f' a' b' c'' d'' b' c'' d'' c'' b' c'' e'' g'' b' c'' d'' c'' b' c'' e' g' b c' e' g' b c' e' g' b c' e' g' b c' e' g' b c'4 r4 <e' c''> r4 g'1 

}





%Default Score Layout
\header{DenemoLayoutName = "Default Score Layout"
        instrumentation = \markup { \with-url #'"scheme:(d-BookInstrumentation)" "Partition entière"}
        }

\header {
tagline = \markup {"" on \simple #(strftime "%x" (localtime (current-time)))}

        }
#(set-default-paper-size "a4")
#(set-global-staff-size 18)
\paper {

       }

\score { %Start of Movement
          <<

%Start of Staff
\new Staff = "Part 1"  << 
 \new Voice = "MvmntIVoiceI"  { 
  \clef treble    \key c \major    \time 4/4   \MvmntIVoiceI
                        } %End of voice

                        >> %End of Staff

          >>

       } %End of Movement



