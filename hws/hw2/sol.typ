#import "../template.typ": *
#import "@preview/diverential:0.2.0": *

#let title = "Assignment #2"
#let author = "f1a3h"
#let course_id = "UCB EE120"
#let instructor = "Murat Arcak"
#let semester = "Fall 2019"

#set enum(numbering: "a)")
#set text(
  font: ("Linux Libertine", "Source Han Serif SC", "LXGW WenKai Screen R"),
)

#show: assignment_class.with(title, author, course_id, instructor, semester)
#show raw: set text(
  font: "JetBrainsMono NF",
)

#prob[
  We can divide $hat(x)(t)$ into two parts, which are $hat(x)_1(t) = x(t-1/2)$ and $hat(x)_2 = -x(t+1/2)$. \
  Acording to the linearity and time shift properties of the Fourier Series, we can derive that the coefficients of $hat(x)_1$ are as follows: \
  $
  hat(a)_(k_1) = cases(
    1/2 "if" k = 0 ",",
    (1 - e^(-j k pi)) / (2 j k pi) = (1 - (-1)^k) / (2 j k pi) "otherwise."
  )
  $
  And of $hat(x)_2$: \
  $
  hat(a)_(k_2) = cases(
    -1/2 "if" k = 0 ",",
    (1 - e^(j k pi)) / (2 j k pi) = (1 - (-1)^k) / (2 j k pi) "otherwise."
  )
  $
  Add these two together, we get the coefficients of $hat(x)$: \
  $
  hat(a)_k = cases(
    0 "if" k = 0 ",",
    (1 - (-1)^k) / (j k pi) "otherwise."
  )
  $
  Finally, simplify the expression, we get: \
  $
  hat(a)_k = cases(
    0 " " k colon "even",
    2 / (j k pi) " " k colon "odd"
  )
  $
]

#prob[
  1. $x(t) = x(-t) => a_k = a_(-k) = a_k^(ast) => a_k "is purely real"$
  2. $x(t) = -x(-t) => a_k = -a_(-k) = -a_k^(*) => a_k "is purely imaginary"$
  3. $x(t) = -x(t + T/2) => a_k = -a_k e^(-j k pi) = a_k (-1)^(k+1) => a_k = 0 "for every even" k$
  4. Omitted.
]

#prob[
  #set math.mat(delim: "[")
  1. $bold(W) = mat(
    Phi_0[0], Phi_1[0], dots, Phi_(N-1)[0];
    Phi_0[1], Phi_1[1], dots, Phi_(N-1)[1];
    dots.v, dots.v, dots.down, dots.v;
    Phi_0[N-1], Phi_1[N-1], dots, Phi_(N-1)[N-1]
  ) = mat(
    1, 1, dots, 1;
    1, e^(j (2 pi) / N), dots, e^(j (N-1) (2 pi)  / N);
    dots.v, dots.v, dots.down, dots.v;
    1, e^(j (N-1) (2 pi)  / N), dots, e^(j (N-1)^2 (2 pi) / N)
  )$
  2. $T = (2 pi) / N = 2 / 3 pi$
     $mat(x[0]; x[1]; x[2]) = mat(1; 0; 0) = bold(W) times mat(a_0; a_1; a_2) = 
     mat(
      1, 1, 1;
      1, e^(j (2 pi) / 3), e^(j (4 pi) / 3);
      1, e^(j (4 pi) / 3), e^(j (8 pi) / 3)
     ) mat(a_0; a_1; a_2)$\
     Thus, $mat(a_0; a_1; a_1) = 1/3 mat(1; 1; 1)$
  3. $bold(W)^(-1) = 1/N mat(
    Phi_0[0], Phi_0[1], dots, Phi_(0)[N-1];
    Phi_1[0], Phi_1[1], dots, Phi_(1)[N-1];
    dots.v, dots.v, dots.down, dots.v;
    Phi_(N-1)[0], Phi_(N-1)[1], dots, Phi_(N-1)[N-1]
  ) = 1/N mat(
    1, 1, dots, 1;
    1, e^(-j (2 pi) / N), dots, e^(-j (N-1) (2 pi)  / N);
    dots.v, dots.v, dots.down, dots.v;
    1, e^(-j (N-1) (2 pi)  / N), dots, e^(-j (N-1)^2 (2 pi) / N)
  )$
  4. $
  bold(W)bold(W)^(-1) = mat(
    Phi_0[0], Phi_1[0], Phi_2[0];
    Phi_0[1], Phi_1[1], Phi_2[1];
    Phi_0[2], Phi_1[2], Phi_2[2]
  ) mat(
    Phi_0[0], Phi_0[1], Phi_0[2];
    Phi_1[0], Phi_1[1], Phi_1[2];
    Phi_2[0], Phi_2[1], Phi_2[2]
  ) = mat(
    1, 0, 0;
    0, 1, 0;
    0, 0, 1
  ) = bold(I)
  $
]

#prob[
  1. $
  dv(X(omega), omega) &= j/2 integral_(-infinity)^(+infinity)dv(e^(-t^2), t) e^(-j omega t) dif t \
  &= -j/2 integral_(-infinity)^(+infinity) e^(-t^2) dif e^(-j omega t) \
  &= -omega/2 integral_(-infinity)^(+infinity) e^(-t^2) e^(-j omega t) dif t \
  &= -omega/2 X(omega)
  $
  2. Obviously, $dv(X(omega), omega) = - (2 omega)/beta dot alpha e^(-omega^2 / beta) = - (2 omega)/beta X(omega)$ \
     To make the equation hold, we need to have $beta = 4$ \
     And we have $X(0) = alpha = sqrt(pi)$, thus the solution is $alpha = sqrt(pi), beta = 4$
]

#prob[
  $r(t) cos(omega_0 t) = s(t) cos(omega_0 t + phi) cos(omega_0) = s(t) dot (cos phi +cos(2omega_0 + phi))/2$ \
  Since the ideal lowpass filter has a cutoff frequency $omega_0$, $cos(2omega_0 + phi)$ will be dropped. \
  For the passband gain, we multiply the remaining term by $2$ to get $y(t) = s(t) cos(phi)$. \
  When $phi = 90^(degree)$, $y(t) equiv 0$.
]