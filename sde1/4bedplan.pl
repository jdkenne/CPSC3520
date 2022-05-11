flower(daisies, med, wet, yellow).
flower(roses, med, dry, red).
flower(petunias, med, wet, pink).
flower(daffodils, med, wet, yellow).
flower(begonias, tall, wet, white).
flower(snapdragons, tall, dry, red).
flower(marigolds, short, wet, yellow).
flower(gardenias, med, wet, red).
flower(gladiolas, tall, wet, red).
flower(bird_of_paradise, tall, wet, white).
flower(lilies, short, dry, white).
flower(azalea, med, dry, pink).
flower(buttercup, short, dry, yellow).
flower(poppy, med, dry, red).
flower(crocus, med, dry, orange).
flower(carnation, med, wet, white).
flower(tulip, short, wet, red).
flower(orchid, short, wet, white).
flower(chrysanthemum, tall, dry, pink).
flower(dahlia, med, wet, purple).
flower(geranium, short, dry, red).
flower(lavender, short, dry, purple).
flower(iris, tall, dry, purple).
flower(peonies, short, dry, pink).
flower(periwinkle, med, wet, purple).
flower(sunflower, tall, dry, yellow).
flower(violet, short, dry, purple).
flower(zinnia, short, wet, yellow).

/* This makes sure that the type of flower does not show up twice in the plan*/

 name(F1,F2,F3,F4) :-
  flower(F1,_,_,_),
  flower(F2,_,_,_),
  flower(F3,_,_,_),
  flower(F4,_,_,_),
  F1\=F2,
  F2\=F3,
  F3\=F4,
  F1\=F4,
  F2\=F4,
  F3\=F1.

/* This checks that the colors are not showing up more than once*/

color(F1,F2,F3,F4) :-
  flower(F1,_,_,C1),
  flower(F2,_,_,C2),
  flower(F3,_,_,C3),
  flower(F4,_,_,C4),
  F1\=F2,
  F2\=F3,
  F3\=F4,
  F1\=F4,
  F2\=F4,
  F3\=F1,

  C1\=C2,
  C2\=C3,
  C3\=C4,
  C1\=C4,
  C2\=C4,
  C3\=C1.

/* This checks and makes sure that only wet flowers go in wet spots and vice versa for dry flowers and spots */

wet(F1,F2,F3,F4) :-
  flower(F1,_,W1,C1),
  flower(F2,_,W2,C2),
  flower(F3,_,W3,C3),
  flower(F4,_,W4,C4),

  F1\=F2,
  F2\=F3,
  F3\=F4,
  F1\=F4,
  F2\=F4,
  F3\=F1,

  C1\=C2,
  C2\=C3,
  C3\=C4,
  C1\=C4,
  C2\=C4,
  C3\=C1,

  W1==dry,
  W2==wet,
  W3==wet,
  W4==dry.


/* This is the rules and the size restrictions for the plan */
adj-to(short,med).
adj-to(med,tall).
adj-to(med,short).
adj-to(tall,med).
adj-to(short,short).
adj-to(med,med).
adj-to(tall,tall).

size(F1,F2,F3,F4) :-
  flower(F1,S1,dry,C1),
  flower(F2,S2,wet,C2),
  flower(F3,S3,wet,C3),
  flower(F4,S4,dry,C4),
  F1\=F2,
  F2\=F3,
  F3\=F4,
  F1\=F4,
  F2\=F4,
  F3\=F1,

  C1\=C2,
  C2\=C3,
  C3\=C4,
  C1\=C4,
  C2\=C4,
  C3\=C1,

  adj-to(S1,S2),
  adj-to(S2,S3),
  adj-to(S3,S4).

/* This is the final bedplan construction predicate */
bedplan(F1,F2,F3,F4) :-
 name(F1,F2,F3,F4),
color(F1,F2,F3,F4),
wet(F1,F2,F3,F4),
size(F1,F2,F3,F4),
flower(F1,S1,W1,C1),
flower(F2,S2,W2,C2),
flower(F3,S3,W3,C3),
flower(F4,S4,W4,C4),
write(F1),write(' is '), write(S1), write(', '), write(W1), write(' and '), write(C1),nl,
write(F2),write(' is '), write(S2), write(', '), write(W2), write(' and '), write(C2),nl,
write(F3),write(' is '), write(S3), write(', '), write(W3), write(' and '), write(C3),nl,
write(F4),write(' is '), write(S4), write(', '), write(W4), write(' and '), write(C4).