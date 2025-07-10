
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
         e''4 d'' c'' b'\AutoBarline
         a' d'' f'' d''\AutoBarline
         c'' b' a' b' \AutoBarline
         c'' e'' g'' f''\AutoBarline
%5
         e'' d'' c'' b'\AutoBarline 
         a' d'' f'' a''\AutoBarline
         e'' d'' c'' b'\AutoBarline 
%10
         a' c'' a' b'\AutoBarline
         c'' a' g' fis'\AutoBarline

         g' a' b' g'\AutoBarline
         a' fis' e' dis'\AutoBarline
%15
         e' fis' g' e'\AutoBarline
         f' d' c' b\AutoBarline
         c' d' e' c'\AutoBarline
         b d' c' a\AutoBarline
         g f' e' d'\AutoBarline
%20
         e' d' c' b\AutoBarline
         a d' f' d'\AutoBarline
         c' b a b\AutoBarline
         c' e' d' g'\AutoBarline
%25
         e'' d'' c'' b'  \AutoBarline
         a' d'' f'' a''\AutoBarline
         g'' f'' e'' d''\AutoBarline
         c''1 \AutoEndMovementBarline
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



