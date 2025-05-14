SELECT COUNT(*) AS tiger_subspecies_count
FROM taxonomy
WHERE species LIKE 'Panthera tigris%';
-- 8

SELECT ncbi_id FROM taxonomy WHERE species LIKE '%sumatran tiger%';
-- 9695
