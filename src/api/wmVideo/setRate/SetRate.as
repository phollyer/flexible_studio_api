package api.wmVideo.setRate
{
	import api.events.wmVideo.setRate.SetRateEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setRate.html Northcode Help Documentation
	*/
	public class SetRate extends WmVideo
	{
		// Optional 
		/**
		* 
		*
		* @defaultValue <code>1</code>
		*/
		public var rate:Number = 1;
		
		/**
		* Constructor for WmVideo.SetRate()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setRate.html Northcode Help Documentation
		*/
		public function SetRate(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setRate.html Northcode Help Documentation
		*/
		public function setRate():void
		{
			ssCore.WmVideo.setRate( {rate:rate}
								   ,{callback:actionComplete, errorSTR:"setRateError", code:"46012"} );
		}
	}
}