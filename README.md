# Corelight

## Overview

Welcome to the Corelight Dashboards for Chronicle. These dashboards are designed to provide you with valuable insights and visualizations for your Corelight data. Whether you're a security analyst, network administrator, or IT professional, these dashboards can help you monitor and analyze network traffic effectively.

## Block Structure

For more information on the Block structure and customization, refer to [Looker Marketplace Documentation](https://docs.looker.com/data-modeling/marketplace/customize-blocks#marketplace_blocks_that_use_refinements)

## Technical installation

### Pre-requisites

- This block works with Chronicle datasets in Google BigQuery.
- The BigQuery Export feature needs to be enabled for your Chronicle tenant. (Reach out to your Chronicle representative to set this up.)
- The connection with Chronicle dataset needs to be created in Looker, refer to [Connecting with DB](https://cloud.google.com/looker/docs/connecting-to-your-db) 

### Installation steps (GitHub)

#### Create a Chronicle Connection

1. To create a connection to the chronicle, First, open the Looker instance and navigate to the Home page.
2. Now select the main menu. Then click Admin and go to the connection page.
3. Now click on the Add connection to create a new connection.
4. Enter the name of the connection as you prefer and select Google BigQuery Standard SQL in the Dialect. Now several new fields will appear. 
5. Enter the Billing Project ID field, where Chronicle data is present.
6. Enter the relevant dataset name.
7. For the authentication choose the service account method and upload the service account file.
8. In Optional settings, Set both the timestamps (Database timestamp and query timestamp) as UTC (the time fields shown in dashboards will be affected accordingly).
9. Click on the Connect button, and it is Done. You are connected to the Chronicle database.

#### Get the Block from the GitHub Repository

1. Fork the **master** branch of this repo.
2. Turn on “Development Mode” in Looker.
3. Select Projects from the Develop menu.
4. From the LookML Projects page, select New LookML Project to open the New Project page.
5. On the New Project page, specify the options for the project:   
    a. Project Name: Give the project name (i.e., corelight-dashboards).  
    b. Starting Point: Choose a Blank Project.  
    c. Select Create Project. Looker creates the project and opens it in the Looker IDE.  
6. Select the Settings icon from the navigation bar, and open the Configure Git page by selecting the Configure Git button.
7. In Looker's Configure Git section, paste the HTTPS URL for the forked Corelight Looker dashboard git repository in the Repository URL field, then select Continue.
8. Enter GitHub username and Personal Access Token, then click “Test and Finalize Setup”.
9. If you get an error like “Ensure credential allow write access failed”, just enter the username and token again and click “Skip Tests and Finalize Setup”.
10. Now, you should be able to see the code from the master branch. If not do the following:  
    a. In the ‘Git Actions’ tab from the left side, click on the “Pull from…” option.  
    b. Select the “Pull From Production” option and click on the Confirm button.
11. In the ‘File Browser’ tab from the left side, click on ‘manifest.lkml’ and update the value of the following constant if required and then click “Save Changes”.  
    a. CONNECTION_NAME: The name of the connection you created to connect with the chronicle.
    b. CHRONICLE_URL: The base URL of your Chronicle tenant (i.e., https://{your_tenant}.backstory.chronicle.security)
12. In the Git Actions, click on “Commit” to push changes to the repository and then click “Deploy to Production”.
13. On the Homepage of your Looker instance, navigate to the “LookML dashboards” tab under the “Folders” tab to access and view all the created dashboards.

### Installation steps (Marketplace)

Currently Block is not published on marketplace, please use steps from getting the block from GitHub Repository.

1. Install this block from the marketplace
2. Required installation parameters:

- CONNECTION_NAME: name of the database connection for the Chronicle dataset in BigQuery
- CHRONICLE_URL: this block contains links back to the UDM search in Chronicle. Enter the base URL of your Chronicle tenant, for e.g. https://{your_tenant}.backstory.chronicle.security

3. Access the block from Browse - Applications & Tools - Corelight Block or the LookML dashboards folder (/folders/lookml). You can customize these dashboards by copying them into one of your instance's folders.

### Reference

- For guidance on fully utilizing and analyzing dashboards in Looker, refer to [Looker Guide Documentation](https://cloud.google.com/looker/docs/viewing-dashboards)
