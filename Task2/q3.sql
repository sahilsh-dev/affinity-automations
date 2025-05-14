SELECT
  t.species     rice_type,
  MAX(r.length) longest_length
FROM rfamseq AS r
JOIN taxonomy AS t
  ON r.ncbi_id = t.ncbi_id
WHERE t.species LIKE 'Oryza sativa%'
GROUP BY t.species
ORDER BY longest_length DESC
LIMIT 1;

-- +---------------------------+----------------+
-- | rice_type                 | longest_length |
-- +---------------------------+----------------+
-- | Oryza sativa Indica Group |       47244934 |
-- +---------------------------+----------------+
