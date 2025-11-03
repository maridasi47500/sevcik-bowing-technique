\version "2.24.3"

\header {
  title = "myscore"
}

global = {
  \key c \major
  \time 4/4
}

MvmntIVoiceI = {
  c''16 c''16 d''16 d''16  c''8\staccato b'\staccato c''\staccato b'\staccato c''\staccato a' \staccato
}

\score {
  \new Staff \with {
    instrumentName = "Violon"
    midiInstrument = "violin"
  } \MvmntIVoiceI
  \layout { }
  \midi {
    \tempo 4=100
  }
}
