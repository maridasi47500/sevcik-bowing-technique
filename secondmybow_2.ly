
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

MvmntIVoiceI = { e'8.\downbow (g'16 e'8. g'16) e'8.\upbow (g'16 e'8. g'16) e'8.\downbow (g'16 e'8. g'16) e'8.\upbow (g'16 e'8. g'16) e'8.\downbow (g'16 e'8. g'16) e'8.\upbow (g'16 e'8. g'16) e'8.\downbow (g'16 e'8. g'16) e'8.\upbow (g'16 e'8. g'16) e'8.\downbow (g'16 e'8. g'16) e'8.\upbow (g'16 e'8. g'16) e'8.\downbow (g'16 e'8. g'16) e'8.\upbow (g'16 e'8. g'16) e'8.\downbow (g'16 e'8. g'16) e'8.\upbow (g'16 e'8. g'16) e'8.\downbow (g'16 e'8. g'16) e'8.\upbow (g'16 e'8. g'16) e'8.\downbow (g'16 e'8. g'16) e'8.\upbow (g'16 e'8. g'16) e'8.\downbow (g'16 e'8. g'16) e'8.\upbow (g'16 e'8. g'16) e'8.\downbow (g'16 e'8. g'16) e'8.\upbow (g'16 e'8. g'16) e'8.\downbow (g'16 e'8. g'16) c'1 }
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
  \clef treble    \key c \major    \time 2/4   \MvmntIVoiceI
                        } %End of voice

                        >> %End of Staff

          >>

       } %End of Movement



