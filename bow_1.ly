
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
         e'2 g'\AutoBarline
         a' f'\AutoBarline
         e' g'\AutoBarline
         f' d'\AutoBarline
%5
         e' g'\AutoBarline
         c'' a'\AutoBarline
         b' d''\AutoBarline
         b' g''\AutoBarline
         b'' fis''\AutoBarline
%10
         g'' e''\AutoBarline
         a'' e''\AutoBarline
         fis'' d''\AutoBarline
         b' g''\AutoBarline
         e'' c''\AutoBarline
%15
         b' a'\AutoBarline
         g' g\AutoBarline
         c' e'\AutoBarline
         f' a\AutoBarline
         c' cis'\AutoBarline
%20
         d' g\AutoBarline
         c'?2 bes\AutoBarline
         a aes\AutoBarline
         g b?2\AutoBarline
         c' c' \AutoEndMovementBarline
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



