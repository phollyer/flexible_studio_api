package api.binaryFile.lock
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	
	[Bindable]
	public class Lock extends BinaryFile
	{
		// Results
		public var systemError:String = null;
		
		public function Lock(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function lock():void
		{
			ssCore.BinaryFile.lock( {} , {callback:actionComplete, errorSTR:"lockError", code:"11006"} );
		}
	}
}