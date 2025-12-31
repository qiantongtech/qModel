[banner.png](.gitee/banner.png)
<p align="center">
 <img src="https://img.shields.io/badge/JDK-1.8+-brightgreen.svg" alt="JDK">
 <img src="https://img.shields.io/badge/Spring%20Boot-2.5.15-blue.svg" alt="Spring Boot">
 <img src="https://img.shields.io/badge/Vue-3.4.31-blue.svg" alt="Vue">
 <img src="https://img.shields.io/badge/license-Apache--2.0-green" alt="License"/>
 <img src="https://img.shields.io/badge/qModel-v1.0.0-blue.svg" alt="qModel"/>
 <img src="https://gitee.com/qiantongtech/qModel/badge/star.svg" alt="Gitee Stars"/>
 <img src="https://img.shields.io/github/stars/qiantongtech/qModel?label=Github%20Stars" alt="GitHub Stars"/>
</p>

<p align="center">
  <a href="README.md">📖简体中文</a> | 📖English
</p>


## 🌈 Introduction

**qModel** is an open-source model management platform centered around **full lifecycle management of AI models**. It provides capabilities including model ingestion, registration, testing, deployment, computation, fusion, orchestration, and service exposure—helping enterprises and research institutions transform algorithmic assets into intelligent services that are operable, reusable, and governable.

The platform supports multiple model formats such as Python scripts, Java JARs, and executable binaries (`exe`), bridging the engineering gap from experimentation to production, and serving as a robust foundation for collaborative applications involving traditional algorithms.

✨✨✨**Live Demo**✨✨✨  
<a href="demo.qmodel.tech" target="_blank">demo.qmodel.tech</a>  
(Username: `qModel`, Password: `qModel123`)

> **qModel — Empowering models throughout their full lifecycle, driving continuous value through intelligence.**

## 🍱 Typical Use Cases

| Scenario                                     | Description                                                                                                                       |
|----------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| **AI Model Asset Management**                | Centralized governance of scattered models across teams, with version control, categorization, tagging, and permission management |
| **Engineering Lab-to-Production Transition** | Rapidly package research algorithms into callable services to accelerate technology transfer                                      |
| **Multi-Model Fusion Inference**             | Supports strategies like weighted averaging, voting, and stacking to enhance prediction robustness                                |
| **Intelligent Workflow Orchestration**       | Visually drag-and-drop to build AI workflows combining multiple models for complex business logic                                 |
| **Private Model Marketplace**                | Establish internal model sharing and trading mechanisms to promote knowledge reuse and innovation                                 |

## 🚀 Key Advantages

- **Full lifecycle coverage**: From upload, testing, and release to monitoring and retirement—fully traceable
- **Multi-language support**: Compatible with Python, Java, executables, and more
- **Lightweight architecture**: Ready-to-run out of the box; supports one-click Docker deployment
- **Modular design**: Core features are decoupled for easy integration and secondary development
- **Open from day one**: Community-driven and continuously evolving

## ✨ Core Features

| Module                              | Description                                                                                                               | Open Source Status |
|-------------------------------------|---------------------------------------------------------------------------------------------------------------------------|--------------------|
| **System Management**               | Unified governance of users, roles, departments, menus, dictionaries, parameters, announcements, and logs                 | ✅ Implemented      |
| **Model Categories**                | Create and manage hierarchical model categories and tag groups                                                            | ✅ Implemented      |
| **Model Management**                | Register, categorize, tag, approve, publish/retire, and version-control models                                            | ✅ Implemented      |
| **Model Computation**               | Manage tasks, configure parameters, visualize results, and download outputs (input data binding required manually in OSS) | ✅ Implemented      |
| **Computation History**             | View historical tasks; filter by model, time, status; and revisit results                                                 | ✅ Implemented      |
| **Model Ingestion & Execution**     | Upload multi-language models, auto-parse metadata, and perform compatibility checks                                       | ❌ Planned          |
| **Model Packaging**                 | Standardized packaging guidelines and documentation                                                                       | ❌ Planned          |
| **Service Governance & Scheduling** | Auto-generate RESTful APIs with authentication, rate limiting, concurrency control, call tracing, and watermarking        | ❌ Planned          |
| **Documentation Center**            | Integrated developer documentation management                                                                             | ❌ Planned          |

> 💡 Note: Advanced features such as automated containerization, online debugging, model fusion, workflow orchestration, and training loop integration will be available in the commercial edition. Community contributions to extend the open-source version are warmly welcomed!

## 🛠️ Tech Stack

qModel adopts a frontend-backend separated architecture: Spring Boot on the backend and Vue 3 on the frontend, integrated with mainstream middleware for enterprise-grade model management.

<table>
  <tr>
    <th>Tech Layer</th><th>Framework</th><th>Description</th>
  </tr>
  <tr>
    <td rowspan="6">Backend</td><td>Spring Boot</td><td>Main application framework</td>
  </tr>
  <tr>
    <td>MyBatis-Plus</td><td>ORM for simplified database operations</td>
  </tr>
  <tr>
    <td>Spring Security</td><td>Authentication and authorization</td>
  </tr>
  <tr>
    <td>Quartz</td><td>Scheduled task execution (e.g., batch computations)</td>
  </tr>
  <tr>
    <td>Alibaba Druid</td><td>High-performance database connection pool</td>
  </tr>
  <tr>
    <td>Swagger</td><td>Auto-generated API documentation</td>
  </tr>

  <tr>
    <td rowspan="7">Frontend</td><td>Vue 3</td><td>Reactive UI framework</td>
  </tr>
  <tr>
    <td>Vite</td><td>Ultra-fast build tool</td>
  </tr>
  <tr>
    <td>Element Plus</td><td>Modern UI component library</td>
  </tr>
  <tr>
    <td>Pinia</td><td>Lightweight state management</td>
  </tr>
  <tr>
    <td>Vue Router</td><td>Client-side routing</td>
  </tr>
  <tr>
    <td>Axios</td><td>HTTP client for API calls</td>
  </tr>
  <tr>
    <td>ECharts</td><td>Visualization of computation results and system metrics</td>
  </tr>

  <tr>
    <td rowspan="4">Third-party Dependencies</td><td>MySQL</td><td>Metadata storage</td>
  </tr>
  <tr>
    <td>Redis</td><td>Task queue and caching</td>
  </tr>
  <tr>
    <td>Docker (optional)</td><td>Containerized deployment (auto-image building in commercial edition)</td>
  </tr>
  <tr>
    <td>Local Storage</td><td>Store model files and computation outputs</td>
  </tr>
</table>

## 🏗️ Deployment Requirements

Ensure the following environment is ready before deploying qModel:

<table>
  <tr>
    <th>Environment</th><th>Component</th><th>Recommended Version</th><th>Note</th>
  </tr>
  <tr>
    <td rowspan="5">Backend</td><td>JDK</td><td>1.8+</td><td>Runtime environment</td>
  </tr>
  <tr>
    <td>Maven</td><td>3.6+</td><td>Project build tool</td>
  </tr>
  <tr>
    <td>MySQL</td><td>5.7 / 8.0</td><td>Metadata database</td>
  </tr>
  <tr>
    <td>Redis</td><td>5.0+</td><td>For task queues and caching</td>
  </tr>
  <tr>
    <td>OS</td><td>Linux / Windows / macOS</td><td>Fully supported</td>
  </tr>

  <tr>
    <td rowspan="3">Frontend</td><td>Node.js</td><td>16+</td><td>Build dependency</td>
  </tr>
  <tr>
    <td>pnpm / npm</td><td>Latest</td><td>Package manager</td>
  </tr>
  <tr>
    <td>Vite</td><td>≥4.0</td><td>Build tool</td>
  </tr>
</table>

## 🚨 Commercial Licensing

qModel offers both **open-source** and **commercial** editions:
- The **open-source edition** is ideal for learning, evaluation, and lightweight production use, licensed under Apache 2.0 (commercial use allowed with logo retention).
- The **commercial edition** targets enterprise and government clients, offering advanced capabilities such as **automated containerization, model fusion, visual workflow orchestration, training-in-loop, and private model marketplace**, along with dedicated technical support and private repository access.

👉 For **custom branding licensing** or **commercial trial requests**, please  
<a href="https://qmodel.qiantong.tech/discuss.html">join our official QQ group for consultation</a>.

## 🚀 Quick Start

👉 <a href="./QUICKSTART.md">View Quick Deployment Guide</a>

## 👥 Community Support

Join the official qModel QQ group to stay updated, ask questions, and share experiences!

👉 <a href="https://qmodel.qiantong.tech/discuss.html">Join the QQ Group</a>

## 🖼️ Screenshots
<table>
    <tr>
        <td><img alt="Login Page" src=".gitee/system/login.png"/></td>
        <td><img alt="Dashboard" src=".gitee/system/workbench.png"/></td>
    </tr>
    <tr>
        <td><img alt="Model List" src=".gitee/system/modelList.png"/></td>
        <td><img alt="Model Detail" src=".gitee/system/modelDetail.png"/></td>
    </tr>
    <tr>
        <td><img alt="Compute Tasks" src=".gitee/system/taskList.png"/></td>
        <td><img alt="Task History" src=".gitee/system/taskHistory.png"/></td>
    </tr>
</table>

<table>
    <tr>
        <td><img alt="Login Page" src=".gitee/system/login.png"/></td>
        <td><img alt="Dashboard" src=".gitee/system/workbench.png"/></td>
    </tr>
    <tr>
        <td><img alt="Model Category" src=".gitee/system/modelCategory.png"/></td>
        <td><img alt="Model Input" src=".gitee/system/input.png"/></td>
    </tr>
    <tr>
        <td><img alt="Model List" src=".gitee/system/modelList.png"/></td>
        <td><img alt="Compute Tasks" src=".gitee/system/taskList.png"/></td>
    </tr>
</table>
