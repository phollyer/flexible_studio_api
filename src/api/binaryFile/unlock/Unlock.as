package api.binaryFile.unlock
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	
	[Bindable]
	public class Unlock extends BinaryFile
	{
		// Results
		public var systemError:String = null;
		
		public function Unlock(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function unlock():void
		{
			ssCore.BinaryFile.unlock( {} , {callback:actionComplete, errorSTR:"unlockError", code:"11011"} );
		}
	}
}