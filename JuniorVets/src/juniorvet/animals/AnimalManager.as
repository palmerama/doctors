package juniorvet.animals
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	
	public class AnimalManager extends EventDispatcher
	{
		private var animalCounter:int;
		public var currentAnimal:Animal;
		
		public var loopScores:Object;
		
		
		public function AnimalManager(target:IEventDispatcher=null)
		{
			super(target);			
			animalCounter = 0;
		}
		
		public function getRandomAnimal():Animal
		{
			var animal:Animal = new AnimalDisplay();
			animal.animalId = getNextAnimalID();
			return animal;
		}
		
		private function getNextAnimalID():int
		{
			return animalCounter++;
		}
		
		public function initLoopScores():void
		{
			loopScores = { diagnosis:0, treatment:0 };
		}
		
		public function calculateDiagnosisMultiplier():void
		{
			loopScores.diagnosis = Math.ceil(Math.random()*4);
		}
		
		public function calculateTreatmentScore():void
		{
			loopScores.treatment = Math.ceil(Math.random()*100);
		}
	}
}