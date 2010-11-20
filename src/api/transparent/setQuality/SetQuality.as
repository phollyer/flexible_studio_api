package api.transparent.setQuality
{
	import flash.events.IEventDispatcher;
	import api.transparent.Transparent;
	
	[Event(name="missingQuality" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetQuality extends Transparent
	{
		// Required
		public var quality:Number = -1
		
		public function SetQuality(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setQuality( qualityNUM:Number = -1 ):void
		{
			quality = compareNumbers( qualityNUM , quality );
			
			switch( quality > -1 )
			{
				case false:
					missingQuality();
					break;
				default:
					ssCore.Transparent.setQuality( {quality:quality}
											  	  ,{callback:actionComplete, errorSTR:"setQualityError", code:"42004"} );
			}
		}
	}
}