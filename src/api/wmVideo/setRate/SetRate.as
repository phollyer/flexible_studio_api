package api.wmVideo.setRate
{
	import api.events.wmVideo.setRate.SetRateEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Set the media playback rate.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setRate.html Northcode Help Documentation
	*/
	public class SetRate extends WmVideo
	{
		// Optional 
		/**
		* The rate is a multiplier value that allows you to play the clip at a faster or slower rate. The default value of 1.0 indicates the authored speed. A playback rate of 0.5 is half the normal speed and 2.0 is twice the normal playback speed.
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
		* Set the media playback rate.
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