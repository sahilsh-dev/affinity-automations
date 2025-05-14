SELECT
  f.rfam_acc,
  f.rfam_id      family_name,
  MAX(r.length)  longest_length
FROM family f
JOIN full_region fr
  ON f.rfam_acc = fr.rfam_acc
JOIN rfamseq r
  ON fr.rfamseq_acc = r.rfamseq_acc
GROUP BY
  f.rfam_acc,
  f.rfam_id
HAVING
  MAX(r.length) > 1000000
ORDER BY
  longest_length DESC
LIMIT 15
OFFSET 120;
