package api.wmAudio.setRate
{
	import api.events.wmAudio.setRate.SetRateEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setRate.html Northcode Help Documentation
	*/
	public class SetRate extends WmAudio
	{
		// Optional 
		/**
		* 
		*
		* @defaultValue <code>1</code>
		*/
		public var rate:Number = 1;
		
		/**
		* Constructor for WmAudio.SetRate()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setRate.html Northcode Help Documentation
		*/
		public function SetRate(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setRate.html Northcode Help Documentation
		*/
		public function setRate():void
		{
			ssCore.WmAudio.setRate( {rate:rate}
								   ,{callback:actionComplete, errorSTR:"setRateError", code:"46007"} );
		}
	}
}