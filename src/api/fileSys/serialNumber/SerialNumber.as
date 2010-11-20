package api.fileSys.serialNumber
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.serialNumber.SerialNumberEvent;
	import api.fileSys.FileSys;

	[Event(name="missingDrive" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.fileSys.serialNumber.SerialNumberEvent")]
	[Bindable]
	public class SerialNumber extends FileSys
	{
		// Required
		public var drive:String = null;
		
		// Result
		public var number:String = null;
		
		public function SerialNumber(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function serialNumber( driveSTR:String = null ):void
		{
			drive = compareStrings( driveSTR , drive );
			
			switch( drive )
			{
				case null:
					missingDrive();
					break;
				default:
					ssCore.FileSys.serialNumber( {drive:drive}
												,{callback:actionComplete, errorSTR:"serialNumberError", code:"9033"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			number = r.result;
			
			var e : SerialNumberEvent = new SerialNumberEvent( SerialNumberEvent.RESULT );
			e.number = number;
			dispatchEvent( e );
		}
	}
}