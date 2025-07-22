use projects;
select * from finance11;
select count(*) from finance11;

select * from finance12;
select count(*) from finance12;

-- Year wise loan_amount 

select year(issue_d) as loan_year, sum(loan_amnt) as total_loan_amount from finance11 
group by loan_year order by loan_year;


-- Grade wise subgrade wise revol_balance

select finance11.grade, finance11.sub_grade, sum(finance12.revol_bal) as total_revol_balance 
from finance11 inner join finance12 on finance11.member_id = finance12.id 
group by finance11.grade, finance11.sub_grade order by finance11.grade, finance11.sub_grade;

-- Total Payment for verified and Non-Verified status 

select finance11.verification_status, sum(finance12.total_pymnt) as total_payment from finance11
inner join finance12 on finance11.member_id = finance12.id 
group by finance11.verification_status order by finance11.verification_status;

-- State wise Month wise Loan status

select addr_state, month(issue_d) as month_name, loan_status, count(*) as total_loans from finance11
group by 1,2,3 order by 1,2,3;

-- Home ownership vs last payment date

select finance11.home_ownership, finance12.last_pymnt_d from finance11
inner join finance12 on finance11.member_id = finance12.id ;


