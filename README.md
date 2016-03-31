# Resonance
Music Web Application

####Instructions to setup git repository.
  - Fork the repository.
  - Clone the forked repository to your local machine.
  
   ```
   $ git clone url
   ```

  - Create a new branch in your machine and checkout that branch to perform all the changes. 
   ```
   $ git branch branch_name
   $ git checkout branch_name
    ```
  - Commit changes in your local machine and then push changes in your branch to your fork when ready.
  
   ```
   $ git push origin branch_name
   ```
  - Go to your repository on github account and select the branch that you just pushed and in right side click pull request.
  - On the new window select main repository as a base repository and master branch as base branch.
  - Merge both branches if no conflict.
  - if there is any conflict you have to update your local machine master branch to main repository master branch by adding it as a new remote.
  
   ```
   $ git remote add upstream main_repository_url
   ```
  - checkout master branch in your local machine **git checkout master**
  - Pull from new remote so both master branch can be merged.
  
   ```
   $ git pull upstream master
   ```
   Now master branch in your local machine is up to date with master of main repo.
   
  - Checkout branch that have your changes **git checkout branch_name**
  - After that merge master into branch(that has your changes) and resolve any conflict.
   
    ```
   $ git merge master branch_name
   ```
   
  - Add and commit your changes after resolving conflict and push your branch to your repository and again generate pull request. In meantime if somebody has not updated main repo master brnach, it should be merged without difficulty as you have resolved the conflict. 

  - Add and commit 
