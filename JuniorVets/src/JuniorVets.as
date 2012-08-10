package
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Quad;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import juniorvet.CustomEvents;
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
			mainMenu.addEventListener(CustomEvents.GOTO_DIAGNOSIS, onGotoDiagnosis, false, 0, true);
			addChild(mainMenu);
			
			diagnosis = new DiagnosisDisplay();
			diagnosis.addEventListener(CustomEvents.GOTO_TREATMENT, onGotoTreatment, false, 0, true);
			addChild(diagnosis);
			
			treatment = new TreatmentDisplay();
			treatment.addEventListener(CustomEvents.GOTO_LOOP_SCORE, onGotoLoopScore, false, 0, true);
			addChild(treatment);
			
			loopScore = new LoopScoreDisplay();
			loopScore.addEventListener(CustomEvents.GOTO_RECOVERY_WARD_WITH_ANIMAL, onGotoRecoveryWardWithAnimal, false, 0, true);
			addChild(loopScore);
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
		
		public function updatePlayerScore():int
		{
			return playerScore += int(animalManager.loopScores.treatment * animalManager.loopScores.diagnosis);
		}
	}
}