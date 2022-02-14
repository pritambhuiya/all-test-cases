function add_num() {
    echo $(( 3 + 2 ))
}

function sub_num () {
    echo $(( 3 - 2 ))
}

function mult_num(){
    echo $(( 3 * 2 ))
}

function div_num (){
    echo $(( 3 / 2 ))
}

function all_test_cases() {
add_num
sub_num
mult_num
div_num
}

all_test_cases