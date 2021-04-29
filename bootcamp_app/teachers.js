const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`SELECT distinct teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN cohorts ON teachers.end_date >= cohorts.start_date or 
teachers.start_date <= cohorts.start_date
WHERE cohorts.name = '${process.argv[2] || 'JUL02'}'
ORDER BY teacher;`)
  .then(res => {
    res.rows.forEach(cohort => {
      console.log(`${cohort.cohort}: ${cohort.teacher}`)
    })
  });
