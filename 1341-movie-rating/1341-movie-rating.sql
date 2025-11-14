(select name as results from MovieRating as mr inner join Users as u 
on mr.user_id=u.user_id
group by u.user_id
order by count(*) desc, name asc limit 1)
union all
(select results from 
(
    select title as results, avg(rating) as a_rating
    from MovieRating as mr inner join
    Movies as m
    on mr.movie_id=m.movie_id
    where month(created_at)=2
    group by m.movie_id
)
rating_group order by a_rating desc, results asc limit 1)