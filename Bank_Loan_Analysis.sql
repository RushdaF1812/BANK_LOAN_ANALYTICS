use bank_loan;

###Total Loan Amount Funded----
select sum(Loan_Amount) as Total_Loan_Funded from bank_loan.loans;

###Total Loans----
select count(Account_ID) as Total_Loans from bank_loan.loans;

###Total Collection----
select sum(Total_Payment) as Total_Collection from bank_loan.loans;

###Total Interest----
select sum(Total_Int) as Total_Interest from bank_loan.loans;

###Branch-Wise Performance----
Select Branch_Name,
		sum(Loan_Amount) as Total_Loan,
        sum(Total_Int) as Total_Interest,
        sum(Total_Payment) as Total_Collection
        from bank_loan.loans
        group by Branch_Name;

###State-Wise Loan----
select State_Name,
		sum(Loan_Amount) as Total_Loan_Amount
        from bank_loan.loans
        group by State_Name;
        
###Religion-Wise Loan
select Religion,
		sum(Loan_Amount) as Total_Loan_Amount
        from bank_loan.loans
        group by Religion;
        
        
###Product Group-Wise Loan
select Purpose_Category,
		sum(Loan_Amount) as Total_Loan_Amount
        from bank_loan.loans
        group by Purpose_Category;
        

###Disbursement Trend---
select year(Disbursement_Date) as Year,
		monthname(Disbursement_Date) as Month,
        sum(Loan_Amount) as Total_Disbursement
        from bank_loan.loans
        group by year(Disbursement_Date),
				month(Disbursement_Date),
                monthname(Disbursement_Date)
		Order by
				year(Disbursement_Date),
                month(Disbursement_Date);
                
		
###Grade-Wise Loan
select Grade,
		sum(Loan_Amount) as Total_Loan_Amount
        from bank_loan.loans
        group by Grade;
        

###Default Loan Count----
select count(*) as Default_Loan_Count
from bank_loan.loans
where Default_Loan = 'Y';


###Delinquent Client Count---
select count(distinct Account_ID) as Delinquent_Clients
		from bank_loan.loans
        where Delinquent_Loan = 'Y';
        
        
###13. Delinquent Loan Rate----
select (count(Case when Delinquent_Loan = 'Y' then 1 end) * 100.0 /
		count(*)) as Delinquent_Loan_Rate
        from bank_loan.loans;
        
        
###14. Default Loan Rate----
select (count(Case when Default_Loan = 'Y' then 1 end) * 100.0 /
		count(*)) as Default_Loan_Rate
        from bank_loan.loans;
        

###15. Loan Status-Wise Loan----
select Loan_Category,
count(*) as Total_Loan,
sum(Loan_Amount) as Total_Loan_Amount,
sum(Total_Payment) as Total_Collection
from bank_loan.loans
group by Loan_Category;


###16. Age Group-Wise Loan
select Age,
	sum(Loan_Amount) as Total_Loan_Amount
    from bank_loan.loans
    group by Age;
    
    
###17. Loan Maturity
select Account_ID,
		datediff(Closed_Date, Disbursement_Date) as Loan_Maturity_Days
        from bank_loan.loans;
        

###18. No Verified Loans
select count(*) as Not_Verified_Loans
from bank_loan.loans
where Verification_Status = 'Not Verified';