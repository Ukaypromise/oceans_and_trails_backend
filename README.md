<a name="readme-top"></a>

# 📖 Oceans and Trails <a name="about-project"></a>


** Oceans and Trails it's an app which helps you reserve and create travel packages, this app consist of a front end developed in react/redux and a back end developed with Ruby on Rails to create an API.
# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

![Screen Shot 2023-01-19 at 13 39 26](https://user-images.githubusercontent.com/99816838/213545038-7add0919-d8d8-4d1b-b735-01c12966391a.png)
![Screen Shot 2023-01-19 at 13 39 39](https://user-images.githubusercontent.com/99816838/213545051-78ef5ab8-594d-4c7b-a0eb-ec1c80543dec.png)
![Screen Shot 2023-01-19 at 13 40 28](https://user-images.githubusercontent.com/99816838/213545070-08bcc4f5-3a5f-44b1-98d7-edda30d08c1c.png)



## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>



<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://reactjs.org/">React.js</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://expressjs.com/">Express.js</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

<!-- ### Key Features <a name="key-features"></a> -->

May find the link to:
[Front end](https://github.com/Flunavgt/oceans_and_trails_frontend)

## Kanban Board 

Link to [Kanban](https://github.com/users/Flunavgt/projects/3)

Back End initial state

![Kanban backend](https://user-images.githubusercontent.com/99816838/213469351-438763f6-7fec-4c27-be98-4099bebeba89.png)


Front End initial state

![Kanban frontend](https://user-images.githubusercontent.com/99816838/213469413-198fa1a4-d75a-4bca-bb7f-cbdb4b21423a.png)


<!-- LIVE DEMO -->


<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>


To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

Make sure you have installed locally:
Ruby 
Nodejs

<!--
Example command:

```sh
 gem install rails
```
 -->

### Setup

Clone this repository to your desired folder : git clone https://github.com/Flunavgt/oceans_and_trails_backend.git

Execute on console making sure you are in the correct directory:
```sh
bundle install
npm i
```

-create a file named application.yml under config folder and write the following Variables:
```sh
USER_NAME = “xxx” (xxx replace with your Postgres user name)
PASSWORD = “xxx” (xxx replace with your Postgres password)
```
-On console execute
```sh
rails db:create
rails db:migrate
rails db:seed
```

-Create Master key:
```sh
EDITOR="mate --wait" bin/rails credentials:edit
```
```sh
rails s
```

clone frontend app: git clone https://github.com/Flunavgt/oceans_and_trails_frontend.git

Navigate to correct directory:

Add Dependencies
```sh
npm i
```

```sh
npm run dev
```
when asked for a new port for local host type "y"


## Testing
You may test by executing:

rspec ./spec/models

rspec ./spec/requests

rails rswag   


 -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>


👤 **Federico Luna V. **

- GitHub: [@Flunavgt](https://github.com/Flunavgt)
- Twitter: [@flunavgt](https://twitter.com/flunavgt)
- LinkedIn: [federico-luna-Gt](https://linkedin.com/in/federico-luna-Gt)

👤 **Addis Tsega **

- GitHub: [Aseadd](https://github.com/Aseadd)
- Twitter: [@AdaTsega](https://twitter.com/AdaTsega)
- LinkedIn: [addis-tsega](https://www.linkedin.com/in/addis-tsega/)

👤 **Amalia Gomez **

- GitHub: [AmaliaGM](https://github.com/AmaliaGM)
- Twitter: [@AmaliaGomezMoro](https://twitter.com/AmaliaGomezMoro)
- LinkedIn: [Maria-Amalia-Gomez](https://www.linkedin.com/in/maria-amalia-gomez-moro/)

👤 **Promise Uka **

- GitHub: [Ukaypromise](https://github.com/Ukaypromise)
- Twitter: [@PromiseUkay](https://twitter.com/PromiseUkay)
- LinkedIn: [Promiseuka](https://www.linkedin.com/in/promiseuka/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->



<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./MIT.md) licensed.



<p align="right">(<a href="#readme-top">back to top</a>)</p>
