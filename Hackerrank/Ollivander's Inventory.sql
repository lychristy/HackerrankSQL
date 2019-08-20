/*
Enter your query here.
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.


*/

select a.id, a.age, a.coins_needed, a.power
from (select w.id, w.power, w.coins_needed, wp.age,
      row_number() over (partition by wp.age, w.power 
                         order by w.coins_needed) as rn
      from Wands w
      left join Wands_Property wp on w.code = wp.code
      where wp.is_evil = 0) a
where a.rn = 1
order by a.power desc, a.age desc
