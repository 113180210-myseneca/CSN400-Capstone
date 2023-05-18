# Checkpoint2 Submission

**COURSE INFORMATION: CSN400-2234**
- **STUDENT’S NAME: Parkhi Sharma**
- **STUDENT'S NUMBER: 113180210**
- **GITHUB USER ID: 113180210-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents
1. [Part A - Adding Files - Local Repo Workflow](#part-a)
2. [Part B - Inspecting Local Repo with `git status` and `git log`](#part-b)
3. [Part C - Creating & Merging Branches](#part-c)
4. [Part D - Git Branching Strategy Review Question](#part-d)

## Part A 

- [untracked files status](./git_status_untracked.txt)
- [commited files status](./git_status_committed.txt)
- [uncommited files status](./git_status_uncommitted.txt)
```bash
commit 1ad050c61b06941928b1d5823349beffd684f256 (HEAD -> main, origin/main, origin/HEAD)
Author: Parkhi Local VSCode <psharma178@myseneca.ca>
Date:   Thu May 18 16:21:26 2023 -0400

    adds table of content

commit c6a4f80579c4fd1f878c7ff7cf5781b542151a9e
Author: Parkhi Local VSCode <psharma178@myseneca.ca>
Date:   Thu May 18 16:03:02 2023 -0400

    adds Checkpoint2/README.md

commit 5cf2805ebf64a6d24b74b82c73483891e84d2233
Author: Parkhi Local VSCode <psharma178@myseneca.ca>
Date:   Thu May 18 16:01:13 2023 -0400

    adds Checkpoint2/README.md

commit 563b1fc498c14c084ea744e103f7584611db11ac
Author: Parkhi Local VSCode <psharma178@myseneca.ca>
Date:   Thu May 18 15:25:14 2023 -0400

    adds a python snippet

commit 678a6966b209233bd43eb0e714a6c606610915ef
Author: Parkhi Local VSCode <psharma178@myseneca.ca>
Date:   Thu May 18 15:18:20 2023 -0400

    adds CP2 README.md
```
## Part B
### Question: You can use `git status` command to understand the status of the files in your working directory, staging area and local repo. You can use `git log` command to get list of your commit history. How do these two commands differ?

*Answer:* The git status command offers details on your working directory's and the staging area's current conditions. It informs you of the files that have been edited, added, or removed as well as whether or not they have been staged.The git log command, however, presents a list of commits in reverse chronological order. It displays details like the commit message, author, date, and commit hash. You may view a timeline of all the commits made to the repository.

## Part C

```
$ git log -n 5
commit 5a4ad4c0a627857de220984fb1112eb467e079e1 (HEAD -> main, origin/feat-emojis, feat-emojis)
Author: Parkhi Local VSCode <psharma178@myseneca.ca>
Date:   Thu May 18 16:58:38 2023 -0400

    adds emojis to feat-emojis branch

commit a9c366e834cc25aa7628c436ba73aab296a322ce
Author: Parkhi Local VSCode <psharma178@myseneca.ca>
Date:   Thu May 18 16:55:30 2023 -0400

    adds emojis to feat-emojis branch

commit a9403c41eecc0e922ea120333692fc1c122386aa (origin/main, origin/HEAD)
Author: Parkhi Local VSCode <psharma178@myseneca.ca>
Date:   Thu May 18 16:49:55 2023 -0400

    adds footnotes

commit 592d4b07730123f2fc1e056de4d79b744f4de9d8
Author: Parkhi Local VSCode <psharma178@myseneca.ca>
Date:   Thu May 18 16:44:54 2023 -0400

    adds part B

commit 39a4cf1e493203c67a6882a487fad4dea0a4bf60
Author: Parkhi Local VSCode <psharma178@myseneca.ca>
Date:   Thu May 18 16:39:38 2023 -0400

    copied files
```
## Part D

### Question 1:What are the differences between `develop` branch and `main` branch?

*Answer:* In Git, the main branch—previously known as master—is commonly regarded as the main branch. It stands for the stable and functionally complete version of the codebase. The main branch of a project is frequently used to monitor its official releases, and it is always expected to be in a deployable state. Usually, after extensive testing and validation, this branch receives merges from other branches.Where continuing development work is done is on the develop branch, also called a development branch. It serves as a staging area for currently being worked on features, bug patches, and other adjustments. To work together on new code and carry out integration testing, developers create and merge feature branches into the develop branch. Once the develop branch's modifications are assessed to be stable, they can be merged into the main branch for publication.

### Question 2:What are the three supporting branches? Briefly describe the function of each of these supporting branches.

*Answer:*
Feature branches: To build new features or functionalities, feature branches are made. In order to complete and test a feature, they enable developers to work on isolated modifications without affecting the develop or main development branch. It is possible to merge the feature back into the main branch once it is complete.

Release branches are formed while getting ready for a new release. They act as a stabilisation area where bugs can be fixed, documentation can be updated, and the last round of testing can be done before the release is made public. The main branch and the develop branch can both incorporate the release branch if it has been determined to be stable. This makes it possible to continue development work while also including problem patches into the upcoming release.

Hotfix branches are used to swiftly fix urgent problems or faults in the production code. They're built off the main branch and enable quick fixes for pressing issues. When the hotfix is finished, it is merged into the develop branch and main branch to guarantee that it will be included in the upcoming release and continued development work.

### Question 3: What are the best practices in working with release branches?

*Answer:*1. Create dedicated release brach from the main branch when trying to release. It fixes bugs without interfering with ongoing development.
2. It is important to freeze new feature development on the branch. This makes sure that only necessary changes for the release are included. New changes would continue to develop on sepearte feature branch.
3. Perform testing on the release branch to see if there are any issue before releasing. This helps ensure that release is stable.
4. If you come across any bugs, fix them directly on the release branch. 
5. Once the release branch is stable and ready to develop, merge it back on the main development branch and release branch itself. This makes sure bugs from release to be indluded in the current development.
6. Make sure to tag the release with a version number or tag so you can track it in the future.





