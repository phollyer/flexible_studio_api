package api.binaryFile.getSize
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	
	import api.events.binaryFile.getSize.GetSizeEvent;
	
	[Event(name="result", type="api.events.binaryFile.getSize.GetSizeEvent")]
	[Bindable]
	public class GetSize extends BinaryFile
	{
		// Results
		public var fileSize:Number = 0;
		public var systemError:String = null;
		
		public function GetSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getSize():void
		{
			ssCore.BinaryFile.getSize( {} , {callback:actionComplete, errorSTR:"getSizeError", code:"11005"} );
		}
		override protected function sendResult( r:Object ):void
		{
			fileSize = Number( r.result );
			var e : GetSizeEvent = new GetSizeEvent( GetSizeEvent.RESULT );
			e.fileSize = fileSize;
			e.systemError = systemError;
			dispatchEvent( e );
		}
	}
}