#import "../template.typ": *
#import "@preview/cetz:0.2.2": *

#let title = "Assignment #1"
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
  1. Let $mu=t - tau$, then we have
    $
    (x ast y)(t) &= integral_(-infinity)^(infinity) x(tau)h(t-tau) d tau \
    &= integral_(infinity)^(-infinity) - x(t-mu)h(mu) d mu \
    &= integral_(-infinity)^(infinity) x(t-mu)h(mu) d mu \
    &= (y ast x)(t)
    $
  2. $
    x ast (h_1 + h_2)(t) &= integral_(-infinity)^(infinity) x(tau)(h_1(t-tau) + h_2(t-tau)) d tau \
    &= integral_(-infinity)^(infinity) x(tau)h_1(t-tau) d tau + integral_(-infinity)^(infinity) x(tau)h_2(t-tau) d tau \
    &= (x ast h_1)(t) + (x ast h_2)(t)
    $
  3. $
    (x ast (h_1 ast h_2))(t) &= integral_(-infinity)^(infinity) x(mu)(integral_(-infinity)^(infinity) h_1(t-tau-mu)h_2(tau) d tau) d mu \
    &= integral_(-infinity)^(infinity) integral_(-infinity)^(infinity) x(mu) h_1(t-tau-mu)h_2(tau) d tau d mu \
    &= integral_(-infinity)^(infinity) h_2(tau) (integral_(-infinity)^(infinity) x(mu) h_1(t-tau-mu) d mu) d tau \
    &= integral_(-infinity)^(infinity) h_2(tau) (x ast h_1)(t-tau) d tau \
    &= h_2 ast (x ast h_1)(t)\
    &= ((x ast h_1) ast h_2) (t)
    $
]

#prob[
  1. stable: $sum h[n]= sum_(i=n-9)^(n) u[i] < infinity$ \
     causal: When $n<0, h[n]=0$ \
     FIR: $h[n] = sum_(i=n)^(n+10) delta[i]$
  2. unstable: $sum h[n] = sum 2^n u[n] = 2^n -1$ ,When $n -> infinity, sum h[n] -> infinity$ \
     causal: When $n<0, h[n]=0$ \
     IIR: A FIR system must be stable. \
  3. stable: $sum h[n] = sum_(i=0)^(infinity) 2^(-i) = 2 < infinity$ \
     non-causal: When $n<0$ , $h[n] = 2^n > 0$ \
     IIR: Since that when $n <= 0, h[n]>0$ and that when $n > 0, h[n] = 0$ , so $y[0] = sum_(k=0)^(infinity) x[k] h[-k]$ . That is to say, $y[n]$ depends on infinite number of $x[k]$.
  4. stable: $sum h[n] = sum_(k=1)^(infinity) k(0.8)^k < sum_(k=1)^(infinity) (1.2)^k (0.8)^k = sum_(k=1)^(infinity) 0.96^k < 24 < infinity$ \
     causal: When $n<0, h[n] = 0$ \
     IIR: Since that when $n > 0, h[n] > 0$, that means $y[n]$ depends on infinite number of $x[k]$.
]

#prob[
  1. Omitted.
  2. Omitted.
  3. If $a_i$ is in the form of $c_i n$, then $a_i y[n-i]$ should be a time-varying system. Thus any linear combination of $a_i y[n-i]$ cannot be a time-invarying system.
  4. Consider the case when $n >= 0$. Obviously, $y[n]=n+2$. After $x[n]$ is scaled by a constant $alpha$, $y[n]$ becomes $alpha n + 1 + alpha$ instead of $alpha(n+2)$.
  5. Yes.
]

#prob[
  1. $h[n]=0.5 delta[n] + 0.25 delta[n+1] + 0.25 delta[n-1]$
  2. $H(e^(j omega)) = sum_(-infinity)^(infinity)h[k] e^(-j omega k)=1/2 + (e^(j omega)+e^(-j omega)) / 4 = (1 + cos omega) / 2 = cos^2 omega / 2$
  2. Low-pass filter.
]

#prob[
  1. $
    R C (d y(t))/(d t) + y(t) &= x(t) \
    R C dot H(j omega) j omega e^(j omega t) + H(j omega) &= e^(j omega t) \
    R C dot H(j omega) j omega + H(j omega) &= 1$ \
    Finally, we get $H(j omega) = frac(1, 1 + R C (j omega)) $ .
  2. $abs(H(j omega)) = frac(1, abs(1 + R C (j omega))) = frac(1, sqrt(1 + (R C omega)^2))$. \
    Plotting is omitted.
]