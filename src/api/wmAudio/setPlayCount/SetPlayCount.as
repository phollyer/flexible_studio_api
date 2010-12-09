package api.wmAudio.setPlayCount
{
	import api.events.wmAudio.setPlayCount.SetPlayCountEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Set the play count. If the play count is not set before you start playing the clip, a default of 1 will be used.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setPlayCount.html Northcode Help Documentation
	*/
	public class SetPlayCount extends WmAudio
	{
		// Optional 
		/**
		* If the count is set to a value less than 1, the clip plays repeatedly, restarting as soon as it reaches the end.
		*
		* @defaultValue <code>1</code>
		*/
		public var count:Number = 1;
		
		/**
		* Constructor for WmAudio.SetPlayCount()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setPlayCount.html Northcode Help Documentation
		*/
		public function SetPlayCount(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set the play count. If the play count is not set before you start playing the clip, a default of 1 will be used.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setPlayCount.html Northcode Help Documentation
		*/
		public function setPlayCount():void
		{
			ssCore.WmAudio.setPlayCount( {count:count}
										,{callback:actionComplete, errorSTR:"setPlayCountError", code:"46006"} );
		}
	}
}