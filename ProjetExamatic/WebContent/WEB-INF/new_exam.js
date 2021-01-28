/**
 * 
 */
let num_questions = 0;
	let choices = [];
	
	$('#newQuestion A').click(function(e)
	{
	   e.preventDefault(); // prevent the link from actually redirecting
	
	   var count = $('#newQuestion').attr('num_questions');
	   $('#newQuestion').attr('num_questions', count+1);
	   //$('#newQuestion').submit();
	});
	
	function addQuestion()
	{
		if(num_questions>99){
			return;
		}
		
		num_questions++;
		document.getElementById("num_questions").value = ''+num_questions;
		
		var element;
		
		var divQuestion = document.createElement("div");
		divQuestion.id = "question"+num_questions;
		divQuestion.class = "form-group";
		element = document.getElementById("questions");
		element.appendChild(divQuestion);
		
		//Creation du question
		var questionTitle = document.createElement("h4");
		questionTitle.innerHTML = "Q" + num_questions + ".";
		divQuestion.appendChild(questionTitle);
		
		var enonce = document.createElement("textarea");
		enonce.placeholder = "Remplir l'énoncé";
		enonce.name = "text" + num_questions;
		enonce.required = true;
		divQuestion.appendChild(enonce);
		
		//var jump = document.createElement("br/");
		//element = document.getElementById("questions");
		//element.appendChild(jump);
		
		//Creation de la reponse
		var answer = document.createElement("input");
		answer.id = "answer"+num_questions;
		answer.placeholder = "Réponse: Tappez A, B, C ou D";
		answer.name = "answer" + num_questions;
		answer.required = true;
		divQuestion.appendChild(answer);
		
		
		//Creation du boutton d'ajout des choix
		choices.push(0);
		var divChoice = document.createElement("div");
		divChoice.id = "divChoice" + num_questions;
		divQuestion.appendChild(divChoice);
		
		var numChoice = document.createElement("input");
		numChoice.type = "hidden";
		numChoice.id = "numChoice" + num_questions;
		numChoice.name = "numChoice" + num_questions;
		numChoice.value = choices[num_questions-1];
		numChoice.required = true;
		divChoice.appendChild(numChoice);
		
		var addChoiceBtn = document.createElement("input");
		addChoiceBtn.type = "button";
		addChoiceBtn.id = "addChoiceBtn" + num_questions;
		addChoiceBtn.value = "Ajouter Choix";
		
		addChoiceBtn.addEventListener  ("click", function() {
			
			var num_question = parseInt(this.parentElement.id.replace('question',''));
			
			divChoice = document.getElementById("divChoice" + num_question);
			
			if(choices[num_question-1] < 4) {
				var divQuestion = document.getElementById("question"+num_question);
				
				var choiceLetter = document.createElement("label");
				letter = String.fromCharCode(65 + choices[num_question-1]);
				choiceLetter.innerHTML = letter + ".";
				divChoice.appendChild(choiceLetter);
				
				var choice = document.createElement("input");
				choice.type = "text";
				choice.placeholder = "Choix " + letter;
				choice.name = "choice" + letter + num_question;
				choice.required = true;
				divChoice.appendChild(choice);
				
				choices[num_question-1] += 1;
				document.getElementById("numChoice" + num_question).value = choices[num_question-1];
			}
		});
		divQuestion.appendChild(addChoiceBtn);
		
	}