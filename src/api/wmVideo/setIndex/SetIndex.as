package api.wmVideo.setIndex
{
	import api.events.wmVideo.setIndex.SetIndexEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>index</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_INDEX
	*/
	[Event(name="missingIndex" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setIndex.html Northcode Help Documentation
	*/
	public class SetIndex extends WmVideo
	{
		// Optional 
		public var index:Number = -1;
		
		/**
		* Constructor for WmVideo.SetIndex()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setIndex.html Northcode Help Documentation
		*/
		public function SetIndex(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param timeIndex
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setIndex.html Northcode Help Documentation
		*/
		public function setIndex( timeIndex:Number = -1 ):void
		{
			index = compareNumbers( timeIndex , index );
			
			switch( index > -1 )
			{
				case false:
					missingIndex();
					break;
				default:
					ssCore.WmVideo.setIndex( {index:index}
											,{callback:actionComplete, errorSTR:"setIndexError", code:"46008"} );
			}
		}
	}
}