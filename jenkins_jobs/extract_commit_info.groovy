def extractCommitInfo(branchName) {
    def lastCommitHash = sh(script: "git rev-parse refs/remotes/origin/${branchName}^{commit}", returnStdout: true).trim()
    def commitMessage = sh(script: "git log --format=%B -n 1 ${lastCommitHash}", returnStdout: true).trim()
    def commitAuthor = sh(script: "git log --format=%an -n 1 ${lastCommitHash}", returnStdout: true).trim()
    def commitTimestamp = sh(script: "git log --format=%at -n 1 ${lastCommitHash}", returnStdout: true).trim()
    
    echo "Commit Message: ${commitMessage}"
    echo "Commit Author: ${commitAuthor}"
    echo "Commit Timestamp: ${commitTimestamp}"
    echo "Last Commit Hash: ${lastCommitHash}"
    
    def gitBranchOutput = sh(script: 'git branch -a -v --no-abbrev', returnStdout: true).trim()
    def branchMatch = (gitBranchOutput =~ /\* (\S+)\s+([0-9a-f]+)\s+(.+)/)
    def branchName = branchMatch[0][1]
    def commit_Message = branchMatch[0][3]
    echo "branch:${branchName},commit:${commit_Message}"
}

return this