// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

contract ScholarHistory {
    enum GradeStatus { Empty, Zero, Reproved, Approved }

    GradeStatus public gradeStatus;

    constructor() {
        gradeStatus = GradeStatus.Empty;
    }

    function updateGradeStatus(uint _value) public {
        if (_value == 0) {
            gradeStatus = GradeStatus.Zero;
        } else if (_value >= 7) {
            gradeStatus = GradeStatus.Approved;
        } else {
            gradeStatus = GradeStatus.Reproved;
        }
    }

    function getGradeStatus() public view returns (string memory) {
        if (gradeStatus == GradeStatus.Empty) return "Empty";
        if (gradeStatus == GradeStatus.Zero) return "Zero";
        if (gradeStatus == GradeStatus.Reproved) return "Reproved";
        return "Approved";
    }
}
