package api.wmVideo.setVolume
{
	import api.events.wmVideo.setVolume.SetVolumeEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setVolume.html Northcode Help Documentation
	*/
	public class SetVolume extends WmVideo
	{
		// Optional 
		public var volume:Number = -5000;
		
		/**
		* Constructor for WmVideo.SetVolume()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setVolume.html Northcode Help Documentation
		*/
		public function SetVolume(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setVolume.html Northcode Help Documentation
		*/
		public function setVolume():void
		{
			ssCore.WmVideo.setVolume( {volume:volume}
									 ,{callback:actionComplete, errorSTR:"setVolumeError", code:"46016"} );
		}
	}
}