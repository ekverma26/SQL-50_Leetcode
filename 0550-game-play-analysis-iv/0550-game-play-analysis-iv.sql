# Write your MySQL query statement below
with first_login as
(
    select a.player_id, min(a.event_date) as firstlogin 
    from Activity as a group by a.player_id
), 
consec_login as
(
    select count(a.player_id) as num 
    from first_login as f
    inner join Activity a on f.player_id= a.player_id
    and f.firstlogin = date_sub(A.event_date, interval 1 day)
)

select round(
    (select c.num from consec_login as c)/
    (select count(f.player_id) from first_login as f), 2
) as fraction;