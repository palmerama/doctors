package
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Quad;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import juniorvet.CareList;
	import juniorvet.Constants;
	import juniorvet.animals.AnimalManager;
	
	import tv.palmerama.utils.CustomEvent;
	
	[SWF(frameRate="30", backgroundColor="#FFFFFF", width="944", height="577")]
	public class JuniorVets extends Sprite
	{
		private var mainMenu:MainMenuDisplay;
		private var diagnosis:DiagnosisDisplay;
		private var treatment:TreatmentDisplay;
		
		private var animalManager:AnimalManager;
		private var loopScore:LoopScoreDisplay;
		
		private var playerScore:int = 0;
		private var careList:CareListDisplay;
		
		
		public function JuniorVets()
		{
			super();
			init();
		}
		
		private function init():void
		{			
			scrollRect = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
			animalManager = new AnimalManager();
			
			mainMenu = new MainMenuDisplay();		
			mainMenu.animalManager = animalManager;
			mainMenu.addEventListener(Constants.GOTO_DIAGNOSIS, onGotoDiagnosis, false, 0, true);
			mainMenu.addEventListener(Constants.GOTO_CARE_LIST, onGotoCareList, false, 0, true);
			addChild(mainMenu);
			
			diagnosis = new DiagnosisDisplay();
			diagnosis.addEventListener(Constants.GOTO_TREATMENT, onGotoTreatment, false, 0, true);
			addChild(diagnosis);
			
			treatment = new TreatmentDisplay();
			treatment.addEventListener(Constants.GOTO_LOOP_SCORE, onGotoLoopScore, false, 0, true);
			addChild(treatment);
			
			loopScore = new LoopScoreDisplay();
			loopScore.addEventListener(Constants.GOTO_RECOVERY_WARD_WITH_ANIMAL, onGotoRecoveryWardWithAnimal, false, 0, true);
			addChild(loopScore);
			
			careList = new CareListDisplay();
			careList.addEventListener(Constants.GOTO_RECOVERY_WARD, onGotoRecoveryWardAfterCareList, false, 0, true);
			addChild(careList);
		}
		
		private function onGotoDiagnosis(event:CustomEvent):void
		{
			animalManager.initLoopScores();
			animalManager.currentAnimal = event.params.animal;
			
			TweenMax.to(mainMenu, .3, {autoAlpha:0, ease:Quad.easeIn});
			TweenMax.to(diagnosis, .5, {autoAlpha:1, ease:Quad.easeIn, delay:.1});
		}
		
		private function onGotoTreatment(event:CustomEvent):void
		{
			animalManager.calculateDiagnosisMultiplier();
			
			TweenMax.to(diagnosis, .3, {autoAlpha:0, ease:Quad.easeIn});
			TweenMax.to(treatment, .5, {autoAlpha:1, ease:Quad.easeIn, delay:.1});
		}
		
		private function onGotoLoopScore(event:CustomEvent):void
		{
			animalManager.calculateTreatmentScore();
			loopScore.useScores(animalManager.loopScores, updatePlayerScore());
			
			TweenMax.to(treatment, .3, {autoAlpha:0, ease:Quad.easeIn});
			TweenMax.to(loopScore, .5, {autoAlpha:1, ease:Quad.easeIn, delay:.1});
		}
		
		private function onGotoRecoveryWardWithAnimal(event:Event):void
		{
			TweenMax.to(loopScore, .3, {autoAlpha:0, ease:Quad.easeIn});
			TweenMax.to(mainMenu, .5, {autoAlpha:1, ease:Quad.easeIn, delay:.1, onComplete:function():void
				{
					mainMenu.gotoRecoveryWardWithAnimal(animalManager.currentAnimal);
				}
			});
		}
		
		private function onGotoCareList(event:CustomEvent):void
		{
			animalManager.currentAnimal = event.params.animal;
			
			TweenMax.to(mainMenu, .3, {autoAlpha:0, ease:Quad.easeIn});
			TweenMax.to(careList, .5, {autoAlpha:1, ease:Quad.easeIn, delay:.1});
		
			careList.populate(mainMenu.recoveryWard.animalList, animalManager.currentAnimal);
		}
		
		private function onGotoRecoveryWardAfterCareList(event:Event):void
		{
			TweenMax.to(careList, .3, {autoAlpha:0, ease:Quad.easeIn});
			TweenMax.to(mainMenu, .5, {autoAlpha:1, ease:Quad.easeIn, delay:.1});
			
			mainMenu.recoveryWard.repopulateAfterCareList();
		}
		
		public function updatePlayerScore():int
		{
			return playerScore += int(animalManager.loopScores.treatment * animalManager.loopScores.diagnosis);
		}
	}
}