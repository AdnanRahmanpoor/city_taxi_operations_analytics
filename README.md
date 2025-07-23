# City Taxi Operations Analytics Project (In-Progress)

A comprehensive SQL and Excel-based analytics solution for taxi/rideshare operations management, providing insights into revenue performance, driver productivity, customer satisfaction, and operational efficiency.

## 🚀 Quick Start

### Prerequisites
- SQLite, PostgreSQL or MySQL database
- Microsoft Excel 2016+ (with Power Query)


## 📁 Project Structure

```
city_taxi_operations_analytics/
├── data/
│   ├── customer_feedback.csv
│   ├── drivers.csv
│   ├── rides.csv
│   └── zones.csv
|
├── excel/
│   └── Taxi_Operations_Dashboard.xlsx
│   
├── output/
│   └── query_results/            # CSV exports from SQL queries
|
├── sql/
│   ├── 01_daily_revenue_trend_7DMSA.sql
│   ├── 02_revenue_analysis_zones.sql
│   ├── 03_peak_offpeak_hours.sql
│   ├── 04_top_10_drivers_by_revenue.sql
│   ├── 05_driver_performance_tier_classification.sql
│   ├── 06_customer_rating_analysis_zones.sql
│   ├── 07_repeat_loya;_customers_analysis.sql
│   ├── 08_fleet_utilization.sql
│   ├── 09_feedback_category_distribution.sql
│   └── 10_revenue_anomaly_detection.sql
|
├── README.md
└── LICENSE
```

## 📊 Key Features

### SQL Analytics Engine
- **10 Comprehensive Queries** covering revenue, performance, and operational metrics
- **Advanced SQL Features:** Window functions, CTEs, statistical analysis
- **Data Quality Validation** and anomaly detection

### Excel Dashboards
- **Executive Dashboard:** *(In Progress)* Key metrics and trend analysis
- **Driver Performance:** Individual and fleet-wide performance tracking  
- **Customer Analytics:** Satisfaction analysis and loyalty metrics
- **Interactive Features:** *(In Progress)* Slicers, conditional formatting, dynamic charts

## 🔍 Analysis Capabilities

### Revenue Analysis
- Daily/weekly/monthly revenue trends with moving averages
- Zone-based performance comparison
- Peak vs off-peak hour analysis
- Surge pricing effectiveness measurement

### Driver Performance
- Multi-tier performance classification (Gold/Silver/Bronze)
- Individual driver scorecards
- Fleet utilization optimization
- Training gap identification

### Customer Experience
- Satisfaction analysis by zone and time
- Loyalty and retention metrics
- Feedback sentiment analysis
- Service quality benchmarking

### Operational Metrics
- Fleet utilization rates
- Demand-supply balance analysis
- Route optimization insights
- Cost efficiency measurements

## 📈 Query Outputs & Analysis

Each SQL query generates specific business insights:

| Query | Output | Business Value |
|-------|--------|---------------|
| Revenue Trend | Daily revenue with 7-day MA | Identifies growth patterns and seasonality |
| Zone Performance | Revenue by geographic area | Optimizes driver allocation and pricing |
| Peak Analysis | Time-based revenue comparison | Improves surge pricing and staffing |
| Driver Rankings | Performance tier classification | Enables targeted training and incentives |
| Customer Satisfaction | Rating analysis by context | Drives service quality improvements |
| Fleet Utilization | Operational efficiency metrics | Reduces costs and improves productivity |

## 🎯 Business Impact

### Proven Results
- **Revenue Optimization:** Identify high-value zones and time periods
- **Cost Reduction:** Optimize fleet size and driver scheduling
- **Quality Improvement:** Target service enhancements based on customer feedback
- **Performance Management:** Data-driven driver coaching and incentives

### KPI Tracking
- Revenue per ride
- Customer satisfaction scores
- Driver productivity metrics
- Fleet utilization rates
- Customer retention rates

## 📋 Data Dictionary

### Core Tables
- **drivers:** Driver profiles and vehicle information
- **zones:** Geographic areas with characteristics
- **rides:** Individual trip records with ratings and payments
- **customer_feedback:** Detailed customer feedback and ratings

### Key Metrics
- **Revenue:** Total fare + tips
- **Performance Tier:** Gold (4.5+ rating, 50+ rides), Silver (4.0+ rating, 30+ rides), Bronze (others)
- **Peak Hours:** 7-9 AM, 5-7 PM weekdays
- **Utilization Rate:** Active drivers / Total available drivers

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines
- Follow SQL style guide (uppercase keywords, meaningful table aliases)
- Document all new queries with business purpose
- Include sample output for new analysis queries
- Update Excel templates when adding new metrics

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## 🏆 Acknowledgments

- Built for taxi and rideshare operators seeking data-driven insights
- Designed for business analysts and operations managers
- Suitable for both small fleets and enterprise operations

---

**Ready to optimize your taxi operations with data-driven insights?** 🚕📊