# 🚀 Rails on Rack — Sample Application

This is a sample Ruby on Rails application demonstrating how to run Rails on Rack and how to integrate a **custom Rack middleware (`ResponseTimer`)** that logs request processing time and injects an HTML comment into HTML responses.

---

## 📦 Ruby & Rails Versions

| Component | Version |
|----------|---------|
| Ruby     | 3.2.2   |
| Rails    | 8.0.0   |

---

## ⚙️ System Dependencies

Make sure the following are installed:

- Ruby 3.2+
- Bundler
- PostgreSQL or SQLite (based on app config)
- Node.js ± Yarn
- Git

---

## 🔧 Installation

Clone the repository:

```bash
git clone https://github.com/code-with-ali-abbas/middleware-with-rails.git

cd rails_on_rack

bundle install

yarn install

bin/rails db:create

bin/rails db:migrate

bin/rails server

http://localhost:3000

To verify the middleware output:

Open the page

Right-click → View Page Source

Scroll to the bottom of the HTML

You should see:

<!-- Response Time: <value> -->
