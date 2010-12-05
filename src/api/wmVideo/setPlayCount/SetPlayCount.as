package api.wmVideo.setPlayCount
{
	import api.events.wmVideo.setPlayCount.SetPlayCountEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Set the play count. If the play count is not set before you start playing the clip, a default of 1 will be used.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setPlayCount.html Northcode Help Documentation
	*/
	public class SetPlayCount extends WmVideo
	{
		// Optional 
		/**
		* If the count is set to a value less than 1, the clip plays repeatedly, restarting as soon as it reaches the end.
		*
		* @defaultValue <code>1</code>
		*/
		public var count:Number = 1;
		
		/**
		* Constructor for WmVideo.SetPlayCount()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setPlayCount.html Northcode Help Documentation
		*/
		public function SetPlayCount(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set the play count. If the play count is not set before you start playing the clip, a default of 1 will be used.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setPlayCount.html Northcode Help Documentation
		*/
		public function setPlayCount():void
		{
			ssCore.WmVideo.setPlayCount( {count:count}
										,{callback:actionComplete, errorSTR:"setPlayCountError", code:"46010"} );
		}
	}
}