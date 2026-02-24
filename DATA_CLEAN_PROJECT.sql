SELECT * 
FROM world_layoff.layoffs;

CREATE TABLE world_layoffs.layoffs_staging 
LIKE world_layoff.layoffs;

INSERT layoffs_staging 
SELECT * FROM world_layoff.layoffs;

SELECT *
FROM world_layoff.layoffs_staging;

select * , 
ROW_NUMBER() OVER (PARTITION BY company, industry, total_laid_off,`date`) AS row_num 
FROM layoffs_staging ;

with duplicate_cte as
(select * , 
ROW_NUMBER() OVER (PARTITION BY company, location, industry, 
total_laid_off,percentage_laid_off,`date`, 
stage, country, funds_raised_millions) AS row_num 
FROM layoffs_staging 
) 
select * from duplicate_cte where row_num  > 1;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from layoffs_staging2;



insert into layoffs_staging2
select * , 
ROW_NUMBER() OVER (PARTITION BY company, location, industry, 
total_laid_off,percentage_laid_off,`date`, 
stage, country, funds_raised_millions) AS row_num 
FROM layoffs_staging ;

delete from layoffs_staging2 where row_num >1 ;

select * from layoffs_staging2;

-- standardizing data

select company,trim(company) from layoffs_staging2;

update layoffs_staging2 
set company=trim(company);

select distinct industry from layoffs_staging2 order by 1;


update layoffs_staging2 set industry = 'Crypto'
where industry like 'Crypto%';


update layoffs_staging2 set industry = 'Finance'
where industry like 'fin%';

select distinct country, trim(trailing '.' from country) from layoffs_staging2 order by 1;


update layoffs_staging2
set country=trim(trailing '.' from country)
where country like 'United States%';

select date,
str_to_date(date,'%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set date=str_to_date(date,'%m/%d/%Y');

select * from layoffs_staging2;

alter table layoffs_staging2
modify column date date;

select * from layoffs_staging2
where total_laid_off is NULL and percentage_laid_off is NULL;

select *
from layoffs_staging2
where industry is Null or industry = '';

update layoffs_staging2
set industry='travel'
where company='Airbnb';

select * from layoffs_staging2;

select distinct company from layoffs_staging2 order by 1;

select distinct industry from layoffs_staging2 order by 1;

select distinct location from layoffs_staging2 order by 1;

UPDATE world_layoff.layoffs_staging2
SET industry = NULL
WHERE industry = '';

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT company, COUNT(*) 
FROM layoffs_staging2
WHERE industry IS NULL
GROUP BY company;

select * from layoffs_staging2 where company like 'Bally%';

select * from layoffs_staging2;

DELETE FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

update layoffs_staging2
set industry='unknown'
where company like 'Bally%' and industry is null;

SELECT 
    SUM(CASE WHEN total_laid_off IS NULL THEN 1 ELSE 0 END) AS total_null,
    SUM(CASE WHEN percentage_laid_off IS NULL THEN 1 ELSE 0 END) AS percentage_null
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;