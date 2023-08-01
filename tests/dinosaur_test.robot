*** Settings ***

Documentation       Gets two creatures DINOSAUR and NOT_DINOSAUR as input and tests
...                 if those are dinosaur by comparing name to an attached list.
...                 Syntax for giving variables in robot startup script:
...                 -v DINOSAUR:Achillobator -v NOT_DINOSAUR:Ptreranodon

Default Tags        dinosaur
Library    SeleniumLibrary
Suite Setup         Read Dinosaurs

Resource            keywords/dinosaur_keywords.robot

*** Variables ***

${DINOSAUR}
${NOT_DINOSAUR}

*** Test Cases  ***

${DINOSAUR} Should Be Dinosaur
    Should Be On Dinosaur List      ${DINOSAUR}
    open browser    https://stackoverflow.com/questions/46812155/how-to-run-headless-remote-chrome-using-robot-framework   gc
    Capture Page Screenshot

${NOT_DINOSAUR} Shoud Not Be Dinosaur
    Should Not Be On Dinosaur List  ${NOT_DINOSAUR} 
