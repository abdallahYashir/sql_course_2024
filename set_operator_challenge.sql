use SAMPLEDB
GO

select sighting_id, common_name, scientific_name, location_of_sighting, sighting_date from bird.california_sightings
union all
select * from bird.arizona_sightings;
-- can also use union
-- can also add the column names

select sighting_id, common_name, scientific_name, location_of_sighting, sighting_date from bird.california_sightings
union
select sighting_id, common_name, scientific_name, sighting_location, sighting_date from bird.arizona_sightings;


select sighting_id, common_name, scientific_name, location_of_sighting, sighting_date from bird.california_sightings
union all
select * from bird.arizona_sightings
order by scientific_name;