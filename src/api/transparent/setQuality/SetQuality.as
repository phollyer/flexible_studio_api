package api.transparent.setQuality
{
	import api.events.transparent.setQuality.SetQualityEvent;

	import api.transparent.Transparent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>quality</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_QUALITY
	*/
	[Event(name="missingQuality" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Allows you to lower the quality of the transparent output to reduce the amount of CPU required.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_setQuality.html Northcode Help Documentation
	*/
	public class SetQuality extends Transparent
	{
		// Required
		public var quality:Number = -1
		
		/**
		* Constructor for Transparent.SetQuality()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_setQuality.html Northcode Help Documentation
		*/
		public function SetQuality(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Allows you to lower the quality of the transparent output to reduce the amount of CPU required.
		*
		*
		* @param qualityNUM
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_setQuality.html Northcode Help Documentation
		*/
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