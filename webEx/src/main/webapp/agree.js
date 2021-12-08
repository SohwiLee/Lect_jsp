  // 전체선택
    function checkAll(checkAll){
        // console.log(checkAll.checked);
        const boxes = document.querySelectorAll('input[type="checkBox"]');
        for(let i=1;i<boxes.length;i++){
            boxes[i].checked=checkAll.checked;
        }
    }
   
    function checkVal(form){
        if(form.terms[1].checked && form.terms[2].checked){
            form.submit();
        }else{
            alert('네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.');
        }
    }