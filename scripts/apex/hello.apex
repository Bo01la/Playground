// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

date dt1 = date.newInstance(2026, 9, 14);
date dt2 = date.newInstance(2026, 5, 10);

Integer dt3 = dt1.daysBetween(dt2);
Integer dt4 = dt2.daysBetween(dt1);
system.debug('the days between are: ' + dt3);
system.debug('the days between are: ' + dt4);

system.debug('unformatted dt1 = ' + dt1);
system.debug('formatted dt1 = ' + dt1.format());
