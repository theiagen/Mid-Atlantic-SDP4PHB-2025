# Software Development Practices for Public Health Bioinformatics
A Mid-Atlantic Workforce Development Offering Provided by the Division of Consolidated Laboratory Services in Collaboration with Theiagen Genomics

## Content
- [Overview](#overview) 
  - [Training Objectives](#training-objectives)
  - [Target Audience](#target-audience)
  - [Course Format](#course-format)
- [Course Content](#course-content)
- [Prerequisites for Hands-On Exercises](#prerequisites-for-hands-on-exercises)

## Overview 
The  Division of Consolidated Laboratory Services, in collaboration with Theiagen Genomics, will be hosting a Software Development Practices for Public Health Bioinformatics Course. This will be a virtual workshop hosted on Tuesdays and Thursdays via Zoom from **February 4th - 27st, 2025**. All training materials will be hosted on this GitHub page to encourage self-paced and asynchronous learning. 

### Training Objectives
- Knowledge of best software development practices applied to public health bioinformatics such as design documents and the use of integrated development environments 
- Proficiency in using version control systems for collaborative development
- Ability to deploy continuous integration and acceptance testing
- Understanding workflow managers and how to construct an analysis pipeline

### Target Audience
This course is designed for bioinformatics scientists interested in strengthening their skill sets as pipeline developers. We aim to cover a comprehensive range of topics, from foundational concepts to advanced techniques, ensuring you gain the knowledge and tools needed to excel in your field. 

Participants should have a strong background in bioinformatics, specifically accessing open-source tools through a command-line interface, running bioinformatics pipelines, and proficiency in at least one scripting language (e.g. Python, Perl, or BASH).  Participants should also have a GitHub account (or an ability to create one). This training is most beneficial for those with access to a Linux environment within their host institution.

### Course Format 
This will be a 4-week training series occurring on Tuesdays and Thrusdays from February 4th - 27th, 2025: 
- Tuesdays (90 min): Lecture material with hands-on exercises
- Thursdays (60 min): "Office hours" style meeting where participants can ask any questions about the material, and the trainers will address any errors encountered by participants.

All lecture content will be recorded and made available through this GitHub repository to facilitate self-paced and asynchronous learning.

## Course Content

### Slides & Exercises
**Week 00: Training Kick-Off**
- [Lecture Slides]()
- [Recording]()

**Week 01: Design Documents & Development Environments**
- [Lecture Slides]()
- [Recording]()
- [Exercise 01: Design Doc, Dev Environment, and Scripting with VSCode]()

**Week 02: Git Fundamentals and Making Source Code Modifications**
- [Lecture Slides]()
- [Recording]()
- [Exercise 02: Version Control with Git]()

**Week 03: Bringing Changes into Production**
- [Lecture Slides]()
- [Recording]()
- [Exercise 03: GitHub Actions & Static Releases]()
  
**Week 04: Getting started with Nextflow**
- [Lecture Slides]()
- [Recording]()
- [Exercise 04: Writing Your First Nextflow Workflow]()

## Prerequisites for Hands-On Exercises
In addition to lectures, this course consists of several hands-on exercises to reinforce the coursework material. To participate in these exercises, trainees will need the following resources: 

### GitHub Account
If you don't already have a GitHub account, please go to github.com and register (it's free!)
  - Once you have registered, ensure you are signed into your account on github.com

### GitPod Account 
- Navigate to https://gitpod.io/
- Select "Continue with GitHub", authorize Gitpod to access your GitHub account, and sign in with your credentials

### GitPod Configuration for Public Repositories
Once registered, navigate to your User Settings to enable write access to public repositories:
- User Settings can be accessed by clicking your profile photo in the upper right hand corner

<p align="center">
  <img src="./images/rm_01.png" width="800" class="center">
</p>


  - Select Git Providers

<p align="center">
  <img src="./images/rm_02.png" width="800" class="center">
</p>


  - Then select the three verticle dots on the right of the GitHub section and select "Edit Permissions"

<p align="center">
  <img src="./images/rm_03.png" width="800" class="center">
</p>


  - From the Edit Permissions menu, check "public_repo", then click "Update Permissions"

<p align="center">
  <img src="./images/rm_04.png" width="400" class="center">
</p>

### GitPod Workspace
  - Navigate to your Workspaces tab and select New Workspace

<p align="center">
  <img src="./images/rm_05.png" width="800" class="center">
</p>

  - Set the repository to https://github.com/theiagen/Mid-Atlantic-SDP4PHB-2025/
  - Select the default Editor and default Class, click "Continue"

<p align="center">
  <img src="./images/e1-1.png" width="600" class="center">
</p>
 

🚨**NOTE**🚨 Once you're finished working, make sure to shut down your workspace to save your allotted free hours (50hr/month) in GitPod. There are a few ways to stop your workspace from running:
- In GitPod environment (VSCode interface), click on the orange Gidpod in bottom left corner. Select "Stop Workspace"

<p align="center">
  <img src="./images/stop-workspace.png" width="600" class="center">
</p>

- Navigate to https://gitpod.io/, find your workspace in the list, click on the three-dot button, and select "Stop" 

<p align="center">
  <img src="./images/stop-workspace2.png" width="800" class="center">
</p>


