(select name as results from MovieRating as mr inner join Users as u 
on mr.user_id=u.user_id
group by u.user_id
order by count(*) desc, name asc limit 1)

union all

(select m.title as results from Movies m
join MovieRating mr on m.movie_id = mr.movie_id
where year(mr.created_at)=2020 and month(mr.created_at)=02
group by m.title, m.movie_id
order by avg(mr.rating) desc, m.title
limit 1)