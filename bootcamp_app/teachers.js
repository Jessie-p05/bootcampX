const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
const queryString = `
SELECT distinct teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN cohorts ON teachers.end_date >= cohorts.start_date or 
teachers.start_date <= cohorts.start_date
WHERE cohorts.name LIKE $1
LIMIT $2;
ORDER BY teacher;
  `;
  const cohortName = process.argv[2];
  const limit = process.argv[3] || 5;
  // Store all potentially malicious values in an array.
  const values = [`%${cohortName}%`, limit];

pool.query( queryString,values)
  .then(res => {
    res.rows.forEach(cohort => {
      console.log(`${cohort.cohort}: ${cohort.teacher}`)
    })
  });
