# README

Overview:

This project is a Job Recommendation Engine built using Ruby on Rails. It processes user data and job listings to generate tailored job recommendations based on various scoring algorithms. The system integrates different scoring models and user skills to refine recommendations and enhance job matching accuracy.

Features:
- Job recommendation engine using multiple scoring models
- User skill assessment and job matching
- Admin dashboard for managing recommendations
- Automated email notifications using mailers
- Background job processing for scalability

Installation:

Prerequisites-
- Ruby (>= 2.7)
- Rails (>= 6.0)
- PostgreSQL or SQLite

Setup:
- Clone the repository
(git clone https://github.com/sarahjspd/jobrec2_app.git
cd jobrec2_app)
- Install dependencies
(bundle install
yarn install)
- Set up the database
(rails db:create db:migrate db:seed)
- Start the Rails server
(rails server)
- Access the application at http://localhost:3000

Usage:
- Users can log in, update their skills, and receive job recommendations.
- Admins can manage job postings and adjust recommendation settings.

Project Structure:
- app/models/: Contains models like category_score, job_skill, and application_score used for recommendation logic.
- app/controllers/: Includes jobs_controller.rb and recrefreshes_controller.rb for handling job matching requests.
- app/jobs/: Background job processing for scalable recommendation updates.
- app/mailers/: Email notifications for job recommendations.

Future Enhancements:
- Improved recommendation accuracy with machine learning models.
- Real-time job updates and notifications.
- API endpoints for third-party integration.

