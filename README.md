Result Analyzer is a Ruby on Rails application designed to process and analyze students’ online test results.

It receives raw result data from a third-party service (MSM) and performs end-of-day (EOD) calculations to generate daily performance summaries for each subject.
Features Implemented (Till Now)
1. Receive & Store Test Results
MSM sends student test results to the app as JSON.

Data fields:
student_name, subject, marks, and submitted_at.

2. Daily Result Calculation
Every day at 6PM (via EodCalculationJob), the app aggregates all results for that day.
It computes Daily Result Stats per subject:

Field	Description
date	Date of aggregation
subject	Subject name
daily_low	Lowest marks of the day
daily_high	Highest marks of the day
result_count	Number of results received for the subject that day

3. Verified Working Flow
API receives results correctly (/api/v1/results).
DailyResultCalculator successfully computes and stores data in DailyResultStat.
EOD job can be manually triggered to perform daily aggregation.


-------------------------------------------------------------------------
Steps to clone the repo
git clone 
cd project_path
bunde install
rails db:create db:migrate
rails s
Craete few Results wth the field 
DailyResultCalculator.new(Date.today).perform
DailyResultStat.all

Result will be visible
-----------------------------------------------------------

Currently I am working on this for Montly result part

